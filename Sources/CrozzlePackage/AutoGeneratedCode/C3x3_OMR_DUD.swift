public class C3x3_OMR_DUD {
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

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for outerx1 in 0..<wordCount {

                        if W.Len[outerx1] >= interlockWidth + 2 {

                            let outerx1Limit = Int(W.Len[outerx1]) - Int(interlockWidth)
                            for outerx1Pos in 1..<outerx1Limit {

                                if (W.Start[outerx1][outerx1Pos + 0] == W.Start[down1][0] &&
                                W.Id[outerx1] != W.Id[down1]) {
                                    //print("outerx1:\(W.Start[outerx1])")

                                    for up2 in 0..<wordCount {

                                        if (W.Len[up2] >= interlockHeight &&
                                            W.End[up2][2] == W.Start[outerx1][outerx1Pos + 1] &&
                                            W.Id[up2] != W.Id[outerx1] &&
                                            W.Id[up2] != W.Id[down1]) {
                                            //print("up2:\(W.Start[up2])")

                                            for middlex2 in 0..<wordCount {

                                                if (W.Len[middlex2] == interlockWidth &&
                                                    W.Start[middlex2][0] == W.Start[down1][1] &&
                                                    W.Start[middlex2][1] == W.End[up2][1] &&
                                                    W.Id[middlex2] != W.Id[up2] &&
                                                    W.Id[middlex2] != W.Id[outerx1] &&
                                                    W.Id[middlex2] != W.Id[down1]) {
                                                    //print("middlex2:\(W.Start[middlex2])")

                                                    for down3 in 0..<wordCount {

                                                        if (W.Len[down3] >= interlockHeight &&
                                                            W.Start[down3][0] == W.Start[outerx1][outerx1Pos + 2] &&
                                                            W.Start[down3][1] == W.Start[middlex2][2] &&
                                                            W.Id[down3] != W.Id[middlex2] &&
                                                            W.Id[down3] != W.Id[up2] &&
                                                            W.Id[down3] != W.Id[outerx1] &&
                                                            W.Id[down3] != W.Id[down1]) {
                                                            //print("down3:\(W.Start[down3])")

                                                            for right3 in 0..<wordCount {

                                                                if (W.Len[right3] >= interlockWidth &&
                                                                    W.Start[right3][0] == W.Start[down1][2] &&
                                                                    W.Start[right3][1] == W.End[up2][0] &&
                                                                    W.Start[right3][2] == W.Start[down3][2] &&
                                                                    W.Id[right3] != W.Id[down3] &&
                                                                    W.Id[right3] != W.Id[middlex2] &&
                                                                    W.Id[right3] != W.Id[up2] &&
                                                                    W.Id[right3] != W.Id[outerx1] &&
                                                                    W.Id[right3] != W.Id[down1]) {
                                                                    //print("right3:\(W.Start[right3])")

                                                                    if phase == 0 {
                                                                        shapeCount += 1
                                                                    }
                                                                    else {
                                                                        outerStart[index + 0] = UInt8(outerx1Pos)

                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, right3, down1, up2, down3])
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
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount))
    }
}