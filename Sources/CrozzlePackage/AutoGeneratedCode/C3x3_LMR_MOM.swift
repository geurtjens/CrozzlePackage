public class C3x3_LMR_MOM {
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

            for middley1 in 0..<wordCount {

                if (W.Len[middley1] == interlockHeight) {
                    //print("middley1:\(W.Start[middley1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.Start[middley1][0] &&
                            W.Id[left1] != W.Id[middley1]) {
                            //print("left1:\(W.Start[left1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.End[left1][1] &&
                                        W.Id[outery2] != W.Id[left1] &&
                                        W.Id[outery2] != W.Id[middley1]) {
                                            //print("outery2:\(W.Start[outery2])")

                                            for middlex2 in 0..<wordCount {

                                                if (W.Len[middlex2] == interlockWidth &&
                                                    W.Start[middlex2][0] == W.Start[middley1][1] &&
                                                    W.Start[middlex2][1] == W.Start[outery2][outery2Pos + 1] &&
                                                    W.Id[middlex2] != W.Id[outery2] &&
                                                    W.Id[middlex2] != W.Id[left1] &&
                                                    W.Id[middlex2] != W.Id[middley1]) {
                                                    //print("middlex2:\(W.Start[middlex2])")

                                                    for middley3 in 0..<wordCount {

                                                        if (W.Len[middley3] == interlockHeight &&
                                                            W.Start[middley3][0] == W.End[left1][0] &&
                                                            W.Start[middley3][1] == W.Start[middlex2][2] &&
                                                            W.Id[middley3] != W.Id[middlex2] &&
                                                            W.Id[middley3] != W.Id[outery2] &&
                                                            W.Id[middley3] != W.Id[left1] &&
                                                            W.Id[middley3] != W.Id[middley1]) {
                                                            //print("middley3:\(W.Start[middley3])")

                                                            for right3 in 0..<wordCount {

                                                                if (W.Len[right3] >= interlockWidth &&
                                                                    W.Start[right3][0] == W.Start[middley1][2] &&
                                                                    W.Start[right3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                    W.Start[right3][2] == W.Start[middley3][2] &&
                                                                    W.Id[right3] != W.Id[middley3] &&
                                                                    W.Id[right3] != W.Id[middlex2] &&
                                                                    W.Id[right3] != W.Id[outery2] &&
                                                                    W.Id[right3] != W.Id[left1] &&
                                                                    W.Id[right3] != W.Id[middley1]) {
                                                                    //print("right3:\(W.Start[right3])")

                                                                    if phase == 0 {
                                                                        shapeCount += 1
                                                                    }
                                                                    else {
                                                                        outerStart[index + 4] = UInt8(outery2Pos)

                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, middlex2, right3, middley1, outery2, middley3])
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
            patternHorizontal: [.leading, .middle, .trailing],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount))
    }
}