public class C3x5_LMOML_OMD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
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

                        for left1 in 0..<wordCount {

                            if (W.Len[left1] >= interlockWidth &&
                                W.End[left1][2] == W.Start[outery1][outery1Pos + 0] &&
                                W.Id[left1] != W.Id[outery1]) {
                                //print("left1:\(W.Start[left1])")

                                for middley2 in 0..<wordCount {

                                    if (W.Len[middley2] == interlockHeight &&
                                        W.Start[middley2][0] == W.End[left1][1] &&
                                        W.Id[middley2] != W.Id[left1] &&
                                        W.Id[middley2] != W.Id[outery1]) {
                                        //print("middley2:\(W.Start[middley2])")

                                        for middlex2 in 0..<wordCount {

                                            if (W.Len[middlex2] == interlockWidth &&
                                                W.Start[middlex2][0] == W.Start[outery1][outery1Pos + 1] &&
                                                W.Start[middlex2][1] == W.Start[middley2][1] &&
                                                W.Id[middlex2] != W.Id[middley2] &&
                                                W.Id[middlex2] != W.Id[left1] &&
                                                W.Id[middlex2] != W.Id[outery1]) {
                                                //print("middlex2:\(W.Start[middlex2])")

                                                for down3 in 0..<wordCount {

                                                    if (W.Len[down3] >= interlockHeight &&
                                                        W.Start[down3][0] == W.End[left1][0] &&
                                                        W.Start[down3][1] == W.Start[middlex2][2] &&
                                                        W.Id[down3] != W.Id[middlex2] &&
                                                        W.Id[down3] != W.Id[middley2] &&
                                                        W.Id[down3] != W.Id[left1] &&
                                                        W.Id[down3] != W.Id[outery1]) {
                                                        //print("down3:\(W.Start[down3])")

                                                        for outerx3 in 0..<wordCount {

                                                            if W.Len[outerx3] >= interlockWidth + 2 {

                                                                let outerx3Limit = Int(W.Len[outerx3]) - Int(interlockWidth)
                                                                for outerx3Pos in 1..<outerx3Limit {

                                                                    if (W.Start[outerx3][outerx3Pos + 0] == W.Start[outery1][outery1Pos + 2] &&
                                                                    W.Start[outerx3][outerx3Pos + 1] == W.Start[middley2][2] &&
                                                                    W.Start[outerx3][outerx3Pos + 2] == W.Start[down3][2] &&
                                                                    W.Id[outerx3] != W.Id[down3] &&
                                                                    W.Id[outerx3] != W.Id[middlex2] &&
                                                                    W.Id[outerx3] != W.Id[middley2] &&
                                                                    W.Id[outerx3] != W.Id[left1] &&
                                                                    W.Id[outerx3] != W.Id[outery1]) {
                                                                        //print("outerx3:\(W.Start[outerx3])")

                                                                        for middlex4 in 0..<wordCount {

                                                                            if (W.Len[middlex4] == interlockWidth &&
                                                                                W.Start[middlex4][0] == W.Start[outery1][outery1Pos + 3] &&
                                                                                W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                                W.Start[middlex4][2] == W.Start[down3][3] &&
                                                                                W.Id[middlex4] != W.Id[outerx3] &&
                                                                                W.Id[middlex4] != W.Id[down3] &&
                                                                                W.Id[middlex4] != W.Id[middlex2] &&
                                                                                W.Id[middlex4] != W.Id[middley2] &&
                                                                                W.Id[middlex4] != W.Id[left1] &&
                                                                                W.Id[middlex4] != W.Id[outery1]) {
                                                                                //print("middlex4:\(W.Start[middlex4])")

                                                                                for left5 in 0..<wordCount {

                                                                                    if (W.Len[left5] >= interlockWidth &&
                                                                                        W.End[left5][2] == W.Start[outery1][outery1Pos + 4] &&
                                                                                        W.End[left5][1] == W.Start[middley2][4] &&
                                                                                        W.End[left5][0] == W.Start[down3][4] &&
                                                                                        W.Id[left5] != W.Id[middlex4] &&
                                                                                        W.Id[left5] != W.Id[outerx3] &&
                                                                                        W.Id[left5] != W.Id[down3] &&
                                                                                        W.Id[left5] != W.Id[middlex2] &&
                                                                                        W.Id[left5] != W.Id[middley2] &&
                                                                                        W.Id[left5] != W.Id[left1] &&
                                                                                        W.Id[left5] != W.Id[outery1]) {
                                                                                        //print("left5:\(W.Start[left5])")

                                                                                        if phase == 0 {
                                                                                            shapeCount += 1
                                                                                        }
                                                                                        else {
                                                                                            outerStart[index + 2] = UInt8(outerx3Pos)

                                                                                            outerStart[index + 5] = UInt8(outery1Pos)

                                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, middlex2, outerx3, middlex4, left5, outery1, middley2, down3])
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
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.leading, .middle, .outer, .middle, .leading],
            patternVertical: [.outer, .middle, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}