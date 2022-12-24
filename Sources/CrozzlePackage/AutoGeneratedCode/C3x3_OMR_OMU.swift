public class C3x3_OMR_OMU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 3
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for outerx1 in 0..<wordCount {

                            if W.Len[outerx1] >= interlockWidth + 2 {

                                let outerx1Limit = Int(W.Len[outerx1]) - Int(interlockWidth)
                                for outerx1Pos in 1..<outerx1Limit {

                                    if (W.Start[outerx1][outerx1Pos + 0] == W.Start[outery1][outery1Pos + 0] &&
                                    W.Id[outerx1] != W.Id[outery1]) {
                                        //print("outerx1:\(W.Start[outerx1])")

                                        for middley2 in 0..<wordCount {

                                            if (W.Len[middley2] == interlockHeight &&
                                                W.Start[middley2][0] == W.Start[outerx1][outerx1Pos + 1] &&
                                                W.Id[middley2] != W.Id[outerx1] &&
                                                W.Id[middley2] != W.Id[outery1]) {
                                                //print("middley2:\(W.Start[middley2])")

                                                for middlex2 in 0..<wordCount {

                                                    if (W.Len[middlex2] == interlockWidth &&
                                                        W.Start[middlex2][0] == W.Start[outery1][outery1Pos + 1] &&
                                                        W.Start[middlex2][1] == W.Start[middley2][1] &&
                                                        W.Id[middlex2] != W.Id[middley2] &&
                                                        W.Id[middlex2] != W.Id[outerx1] &&
                                                        W.Id[middlex2] != W.Id[outery1]) {
                                                        //print("middlex2:\(W.Start[middlex2])")

                                                        for up3 in 0..<wordCount {

                                                            if (W.Len[up3] >= interlockHeight &&
                                                                W.End[up3][2] == W.Start[outerx1][outerx1Pos + 2] &&
                                                                W.End[up3][1] == W.Start[middlex2][2] &&
                                                                W.Id[up3] != W.Id[middlex2] &&
                                                                W.Id[up3] != W.Id[middley2] &&
                                                                W.Id[up3] != W.Id[outerx1] &&
                                                                W.Id[up3] != W.Id[outery1]) {
                                                                //print("up3:\(W.Start[up3])")

                                                                for right3 in 0..<wordCount {

                                                                    if (W.Len[right3] >= interlockWidth &&
                                                                        W.Start[right3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                        W.Start[right3][1] == W.Start[middley2][2] &&
                                                                        W.Start[right3][2] == W.End[up3][0] &&
                                                                        W.Id[right3] != W.Id[up3] &&
                                                                        W.Id[right3] != W.Id[middlex2] &&
                                                                        W.Id[right3] != W.Id[middley2] &&
                                                                        W.Id[right3] != W.Id[outerx1] &&
                                                                        W.Id[right3] != W.Id[outery1]) {
                                                                        //print("right3:\(W.Start[right3])")

                                                                        if phase == 0 {
                                                                            shapeCount += 1
                                                                        }
                                                                        else {
                                                                            outerStart[index + 0] = UInt8(outerx1Pos)

                                                                            outerStart[index + 3] = UInt8(outery1Pos)

                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, right3, outery1, middley2, up3])
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return RemoveDuplicates.RemoveDuplicates3x3(cluster: ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.outer, .middle, .trailing],
            patternVertical: [.outer, .middle, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount))
    }
}